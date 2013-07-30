package com.zhongxin.ctsms.modules.coal.web.contract;

import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.utils.FileOperateUtil;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.coal.entity.PFile;
import com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract;
import com.zhongxin.ctsms.modules.coal.service.contract.PurchaseContractService;
import com.zhongxin.ctsms.modules.sys.entity.User;
import com.zhongxin.ctsms.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-7-16
 * Time: 下午4:37
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "${adminPath}/coal/contract/purchase")
public class PurchaseContractController extends BaseController {

    @Autowired
    private PurchaseContractService contractService;

    @ModelAttribute("purchaseContract")
    public PurchaseContract get(@RequestParam(required=false) Long id) {
        if (id != null){
            return contractService.get(id);
        }else{
            return new PurchaseContract();
        }
    }

    @RequiresPermissions("coal:contract:view")
    @RequestMapping(value = {"list", ""})
    public String list(PurchaseContract contract, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = UserUtils.getUser();
        if (!user.isAdmin()){
            //contract.setUser(user);
        }
        Page<PurchaseContract> page = contractService.find(new Page<PurchaseContract>(request, response), contract);
        model.addAttribute("page", page);
        return "modules/coal/contract/purchaseContractList";
    }

    @RequiresPermissions("coal:contract:view")
    @RequestMapping(value = "form")
    public String form(PurchaseContract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/contract/purchaseContractForm";
    }

    @RequiresPermissions("coal:contract:edit")
    @RequestMapping(value = "save")
    public String save(PurchaseContract contract, Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, contract)){
            return form(contract, model);
        }

        // 处理文件上传
        if (contract.getFileData() != null) {
            String pathDir = "/upload/" + contract.getContractId() + "/";
            List<PFile> files = null;
            try {
                files = FileOperateUtil.upload(request, contract.getFileData(), pathDir);
/*                for(PFile f : files){
                    f.setContract(contract);
                }*/
            } catch (Exception e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
            contract.setFiles(files);
        }
        contractService.save(contract);
        addMessage(redirectAttributes, "保存合同'" + contract.getContractId() + "'成功");
        return "redirect:"+ Global.getAdminPath()+"/coal/contract/purchase/?repage";
    }

    @RequiresPermissions("coal:contract:edit")
    @RequestMapping(value = "delete")
    public String delete(Long id, RedirectAttributes redirectAttributes) {
        contractService.delete(id);
        addMessage(redirectAttributes, "删除合同成功");
        return "redirect:"+Global.getAdminPath()+"/coal/contract/purchase/?repage";
    }

    @RequiresPermissions("coal:contract:edit")
    @RequestMapping(value = "delFile")
    public String delFile(PurchaseContract contract, Model model,String id, String prjId) {
        contractService.delPFileById(Long.valueOf(id));
        contract = contractService.get(Long.valueOf(prjId));
        for(PFile pFile : contract.getFiles()){
            if(Long.valueOf(id) == pFile.getId()){
                contract.getFiles().remove(pFile);
            }
        }
        model.addAttribute("contract", contract);
        return "modules/coal/contract/purchaseContractForm";
    }

}
