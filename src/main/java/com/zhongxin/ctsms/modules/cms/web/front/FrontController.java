/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/zhongxin/ctsms">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.zhongxin.ctsms.modules.cms.web.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.servlet.ValidateCodeServlet;
import com.zhongxin.ctsms.common.utils.StringUtils;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.cms.entity.Article;
import com.zhongxin.ctsms.modules.cms.entity.Category;
import com.zhongxin.ctsms.modules.cms.entity.Comment;
import com.zhongxin.ctsms.modules.cms.entity.Link;
import com.zhongxin.ctsms.modules.cms.entity.Site;
import com.zhongxin.ctsms.modules.cms.service.ArticleService;
import com.zhongxin.ctsms.modules.cms.service.CategoryService;
import com.zhongxin.ctsms.modules.cms.service.CommentService;
import com.zhongxin.ctsms.modules.cms.service.LinkService;
import com.zhongxin.ctsms.modules.cms.utils.CmsUtils;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontController extends BaseController{
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private LinkService linkService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 网站首页
	 */
	@RequestMapping
	public String index(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontIndex";
	}
	
	/**
	 * 网站首页
	 */
	@RequestMapping(value = "index-{siteId}${urlSuffix}")
	public String index(@PathVariable Long siteId, Model model) {
		if (siteId.longValue() == 1){
			return "redirect:"+Global.getFrontPath();
		}
		Site site = CmsUtils.getSite(siteId);
		model.addAttribute("site", site);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontIndex";
	}
	
	/**
	 * 内容列表
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "list-{categoryId}${urlSuffix}")
	public String list(@PathVariable Long categoryId, @RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="30") Integer pageSize, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		model.addAttribute("site", category.getSite());
		// 2：简介类栏目，栏目第一条内容
		if("2".equals(category.getShowModes()) && "article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId() == 1L){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			model.addAttribute("category", category);
			model.addAttribute("categoryList", categoryList);
			// 获取文章内容
			Page<Article> page = new Page<Article>(1, 1, -1);
			Article article = new Article(category);
			page = articleService.find(page, article, false);
			if (page.getList().size()>0){
				article = page.getList().get(0);
				articleService.updateHitsAddOne(article.getId());
			}
			model.addAttribute("article", article);
			return "modules/cms/front/themes/"+category.getSite().getTheme()+"/frontViewArticle";
		}else{
			List<Category> categoryList = categoryService.findByParentId(category.getId(), category.getSite().getId());
			// 展现方式为1 、无子栏目或公共模型，显示栏目内容列表
			if("1".equals(category.getShowModes())||categoryList.size()==0){
				// 有子栏目并展现方式为1，则获取第一个子栏目；无子栏目，则获取同级分类列表。
				if(categoryList.size()>0){
					category = categoryList.get(0);
				}else{
					// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
					if (category.getParent().getId() == 1L){
						categoryList.add(category);
					}else{
						categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
					}
				}
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				// 获取内容列表
				if ("article".equals(category.getModule())){
					Page<Article> page = new Page<Article>(pageNo, pageSize);
					page = articleService.find(page, new Article(category), false);
					model.addAttribute("page", page);
					// 如果第一个子栏目为简介类栏目，则获取该栏目第一篇文章
					if ("2".equals(category.getShowModes())){
						Article article = new Article(category);
						if (page.getList().size()>0){
							article = page.getList().get(0);
							articleService.updateHitsAddOne(article.getId());
						}
						model.addAttribute("article", article);
						return "modules/cms/front/themes/"+category.getSite().getTheme()+"/frontViewArticle";
					}
				}else if ("link".equals(category.getModule())){
					Page<Link> page = new Page<Link>(1, -1);
					page = linkService.find(page, new Link(category), false);
					model.addAttribute("page", page);
				}
				return "modules/cms/front/themes/"+category.getSite().getTheme()+"/frontList";
			}
			// 有子栏目：显示子栏目列表
			else{
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				Map<Category, List> categoryMap = Maps.newLinkedHashMap();
				for (Category c : categoryList){
					if (Category.SHOW.equals(c.getInList())){
						if ("article".equals(c.getModule())){
							categoryMap.put(c, articleService.find(new Page<Article>(1, 5, -1),
									new Article(c), false).getList());
						}else if ("link".equals(c.getModule())){
							categoryMap.put(c, linkService.find(new Page<Link>(1, 5, -1),
									new Link(c), false).getList());
						}
					}
				}
				model.addAttribute("categoryMap", categoryMap);
				return "modules/cms/front/themes/"+category.getSite().getTheme()+"/frontListCategory";
			}
		}
	}

	/**
	 * 显示内容
	 */
	@RequestMapping(value = "view-{categoryId}-{contentId}${urlSuffix}")
	public String view(@PathVariable Long categoryId, @PathVariable Long contentId, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		model.addAttribute("site", category.getSite());
		if ("article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId() == 1L){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			// 获取文章内容
			Article article = articleService.get(contentId);
			if (article==null || !Article.DEL_FLAG_NORMAL.equals(article.getDelFlag())){
				return "error/404";
			}
			// 文章阅读次数+1
			articleService.updateHitsAddOne(contentId);
			// 获取推荐文章列表
			List<Object[]> relationList = articleService.findByIds(article.getArticleData().getRelation());
			// 将数据传递到视图
			model.addAttribute("category", article.getCategory());
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("article", article);
			model.addAttribute("relationList", relationList); 
			return "modules/cms/front/themes/"+category.getSite().getTheme()+"/frontViewArticle";
		}
		return null;
	}
	
	/**
	 * 内容评论
	 */
	@RequestMapping(value = "comment", method=RequestMethod.GET)
	public String comment(String theme, Comment comment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Comment> page = new Page<Comment>(request, response);
		Comment c = new Comment();
		c.setCategory(comment.getCategory());
		c.setContentId(comment.getContentId());
		c.setDelFlag(Comment.DEL_FLAG_NORMAL);
		page = commentService.find(page, c);
		model.addAttribute("page", page);
		model.addAttribute("comment", comment);
		return "modules/cms/front/themes/"+theme+"/frontComment";
	}
	
	/**
	 * 内容评论保存
	 */
	@ResponseBody
	@RequestMapping(value = "comment", method=RequestMethod.POST)
	public String commentSave(Comment comment, String validateCode,@RequestParam(required=false) Long replyId, HttpServletRequest request) {
		if (StringUtils.isNotBlank(validateCode)){
			if (ValidateCodeServlet.validate(request, validateCode)){
				if (replyId!=null && replyId!=0){
					Comment replyComment = commentService.get(replyId);
					if (replyComment != null){
						comment.setContent("<div class=\"reply\">"+replyComment.getName()+":<br/>"
								+replyComment.getContent()+"</div>"+comment.getContent());
					}
				}
				comment.setIp(request.getRemoteAddr());
				comment.setCreateDate(new Date());
				comment.setDelFlag(Comment.DEL_FLAG_AUDIT);
				commentService.save(comment);
				return "{result:1, message:'提交成功，请等待管理员审核。'}";
			}else{
				return "{result:2, message:'验证码不正确。'}";
			}
		}else{
			return "{result:2, message:'验证码不能为空。'}";
		}
	}
	
	/**
	 * 站点地图
	 */
	@RequestMapping(value = "map-{siteId}${urlSuffix}")
	public String map(@PathVariable Long siteId, Model model) {
		Site site = CmsUtils.getSite(siteId!=null?siteId:Site.defaultSiteId());
		model.addAttribute("site", site);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontMap";
	}
	
	/**
	 * 全站搜索
	 */
	@RequestMapping(value = "search")
	public String search(String t, String q, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		if (StringUtils.isBlank(t) || "article".equals(t)){
			// ========= 正式环境，请注释掉cmd代码 =========
			if ("cmd:reindex".equals(q)){
				articleService.createIndex();
				model.addAttribute("message", "重建索引成功");
				return "modules/cms/front/themes/"+site.getTheme()+"/frontSearch";
			}
			// ========= ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ ==========
			Page<Article> page = articleService.search(new Page<Article>(request, response), q);
			model.addAttribute("page", page);
		}
		model.addAttribute("t", t);// 搜索类型
		model.addAttribute("q", q);// 搜索关键字
		return "modules/cms/front/themes/"+site.getTheme()+"/frontSearch";
	}
	
}
