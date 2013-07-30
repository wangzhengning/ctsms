package com.zhongxin.ctsms.modules.coal.web;

import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.mapper.JsonMapper;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.coal.entity.Demand;
import com.zhongxin.ctsms.modules.coal.service.DemandService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-25
 * Time: 下午9:53
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "${adminPath}/coal/demand")
public class DemandController extends BaseController {

    @Autowired
    private DemandService demandService;

    @ModelAttribute("demand")
    public Demand get(@RequestParam(required = false) Long id){
        if(id != null){
            return demandService.get(id);
        }else {
            return new Demand();
        }
    }

    @RequiresPermissions("coal:demand:view")
    @RequestMapping(value = {"list", ""})
    public String list(Demand demand,HttpServletRequest request, HttpServletResponse response,Model model){
        Page<Demand> page = demandService.find(new Page<Demand>(request,response),demand);
        model.addAttribute("page",page);
        return "modules/coal/demandList";
    }

    @RequiresPermissions("coal:demand:view")
    @RequestMapping(value = "form")
    public String form(Demand demand, Model model) {
        model.addAttribute("demand", demand);
        return "modules/coal/demandForm";
    }

    @RequiresPermissions("coal:demand:edit")
    @RequestMapping(value = "save")//@Valid
    public String save(Demand demand, RedirectAttributes redirectAttributes) {
        if (beanValidator(redirectAttributes, demand)){
            demandService.save(demand);
            addMessage(redirectAttributes, "保存需方信息'" + demand.getDemandName() + "'成功");
        }
        return "redirect:"+Global.getAdminPath()+"/coal/demand/?repage";
    }

    @RequiresPermissions("coal:demand:edit")
    @RequestMapping(value = "delete")
    public String delete(Long id, RedirectAttributes redirectAttributes) {
        demandService.delete(id);
        addMessage(redirectAttributes, "删除需方信息成功");
        return "redirect:"+ Global.getAdminPath()+"/coal/demand/?repage";
    }

    /**
     * 通过名字获取
     */
    @RequiresPermissions("coal:demand:view")
    @ResponseBody
    @RequestMapping(value = "findByName")
    public String findByName(String name, Model model) {
        List<Demand> list = demandService.findByDemandNameLike(name);
        return JsonMapper.nonDefaultMapper().toJson(list);
    }
}
