package com.grasell.example

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HealthController {
    @GetMapping("/_health")
    fun getHealth(): String {
        return "OK"
    }
}