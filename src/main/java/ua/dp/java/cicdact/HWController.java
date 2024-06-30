package ua.dp.java.cicdact;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
public class HWController {
    @GetMapping
    Mono<String> hw() {
        return Mono.just("Hillow");
    }
}
