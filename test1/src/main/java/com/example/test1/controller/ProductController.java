package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.ProductService;
import com.example.test1.model.Product;
import com.google.gson.Gson;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    // List all products
    @GetMapping("/list")
    public String listProducts(Model model) {
        model.addAttribute("products", productService.findAllProducts());
        return "productList";
    }

    // Show product detail
    @GetMapping("/detail/{itemNo}")
    public String productDetail(@PathVariable String itemNo, Model model) {
        model.addAttribute("product", productService.findProductByItemNo(itemNo));
        return "productDetail";
    }

    // Show form for new product
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("product", new Product());
        return "productForm";
    }

    // Save new product
    @PostMapping("/save")
    public String saveProduct(@ModelAttribute Product product) {
        if (product.getItemNo() == null) {
            productService.addProduct(product);
        } else {
            productService.editProduct(product);
        }
        return "redirect:/product/list";
    }

    // Show form for editing a product
    @GetMapping("/edit/{itemNo}")
    public String showEditForm(@PathVariable String itemNo, Model model) {
        model.addAttribute("product", productService.findProductByItemNo(itemNo));
        return "productForm";
    }

    // Delete a product
    @GetMapping("/delete/{itemNo}")
    public String deleteProduct(@PathVariable String itemNo) {
        productService.removeProductByItemNo(itemNo);
        return "redirect:/product/list";
    }
}