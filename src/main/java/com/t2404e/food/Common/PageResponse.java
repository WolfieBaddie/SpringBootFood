package com.t2404e.food.Common;
import lombok.*;
import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PageResponse<T> {
    private List<T> content;
    private int page;          // 1-based
    private int limit;
    private int totalPages;
    private long totalElements;
}
