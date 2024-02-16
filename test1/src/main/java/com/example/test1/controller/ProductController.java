package com.example.test1.controller;
import java.util.List;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.test1.dao.ProductService;
import com.google.gson.Gson;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // Product list
    @RequestMapping("/productList.do")
    public String productList(Model model) throws Exception {
        model.addAttribute("products", productService.getAllProducts());
        return "product-list";
    }

    // Navigate to Product Insert page
    @RequestMapping("/productInsert.do")
    public String productInsert(Model model) throws Exception {
        return "product-insert";
    }

    // Navigate to Product Update page
    @RequestMapping("/productUpdate.do")
    public String productUpdate(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        request.setAttribute("map", map);
        return "product-update";
    }

    // Product Detail View
    @RequestMapping("/productView.do")
    public String productView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        request.setAttribute("map", map);
        return "product-view";
    }

    // AJAX: Insert Product
    @RequestMapping(value = "/productInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productInsert(@RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = productService.addProduct(map);
        return new Gson().toJson(resultMap);
    }

    // AJAX: Update Product
    @RequestMapping(value = "/productUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productUpdate(@RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = productService.editProduct(map);
        return new Gson().toJson(resultMap);
    }

    // AJAX: Delete Product
    @RequestMapping(value = "/productRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productRemove(@RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = productService.removeProduct(map);
        return new Gson().toJson(resultMap);
    }

    // AJAX: Fetch Product Details
    @RequestMapping(value = "/productDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productDetail(@RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = productService.getProductDetail(map);
        return new Gson().toJson(resultMap);
    }
}
