# Food API (Spring Boot) — Module Món Ăn (Dish)

> Dự án mẫu theo cấu trúc doanh nghiệp: **Controller → Service → Repository → Entity → DTO → Mapper → Specification**, có **ApiResponse** thống nhất, **Validation**, **Soft-Delete**, **Swagger** và seed dữ liệu.
>
> Mục tiêu: đáp ứng đầy đủ tiêu chí bài tập (mục 2 → 7).

---

## 1. Công nghệ & Yêu cầu

- Java 17+
- Spring Boot 3.x
- Spring Web, Spring Data JPA, Validation
- CSDL: MySQL 8+ (hoặc PostgreSQL nếu muốn)
- Lombok
- springdoc-openapi (Swagger UI)
- Maven

---

## 2. Cấu trúc thư mục đề xuất

```
com.t2404e.food
├─ Common/
│  ├─ ApiResponse.java
│  ├─ PageResponse.java
│  └─ ErrorCode.java
├─ Entity/
│  ├─ Category.java
│  ├─ Dish.java
│  └─ DishStatus.java
└─ Repository/
│  ├─ CategoryRepository.java
│  └─ DishRepository.java
└─ Spec/
│     └─ DishSpecifications.java
├─ Service/
│  ├─ CategoryService.java
│  ├─ DishService.java
│  ├─ CategoryServiceImpl.java
│  └─ DishServiceImpl.java
├─ controller/
│  ├─ CategoryController.java
│  └─ DishController.java
├─ dto/
│  ├─ CategoryDto.java
│  ├─ DishDto.java
│  ├─ DishCreateRequest.java
│  └─ DishUpdateRequest.java
├─ mapper/
│  ├─ CategoryMapper.java
│  └─ DishMapper.java
└─ handler/
   └─ GlobalExceptionHandler.java
```

---

## 3. Cấu hình ứng dụng

`src/main/resources/application.properties` (ví dụ MySQL)

```properties
server.port=8080

spring.datasource.url=jdbc:mysql://localhost:3306/food?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=your_password

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.jdbc.time_zone=UTC

## 4. Chạy nhanh

```bash
# 1) Build
mvn clean package -DskipTests

# 2) Run
mvn spring-boot:run
# hoặc:
java -jar target/food-*.jar
```

---
## 5. Tài liệu API (tóm tắt)

### 5.1 Response chuẩn
Mọi API bọc trong `ApiResponse<T>`:
```json
{
  "success": true,
  "data": { },
  "message": null
}
```

**Phân trang** dùng `PageResponse<T>`:
```json
{
  "content": [ /* ... */ ],
  "page": 1,
  "limit": 5,
  "totalPages": 10,
  "totalElements": 50
}
```

### 5.2 Endpoints

#### (A) Categories
- **GET** `/api/v1/categories` → trả danh sách danh mục (DTO) cho dropdown.

#### (B) Dishes

1) **GET** `/api/v1/dishes` — *Danh sách có phân trang, lọc, sắp xếp*  
Query params:
- `page` (int, default `1`), `limit` (int, default `5`)  
- `sortBy` (string, default `startDate`), `sortDir` (`asc|desc`, default `desc`)  
- `status` (`ON_SALE|STOPPED`, default `ON_SALE`) — *`DELETED` không được trả về ở endpoint này*  
- `keyword` (string), `categoryId` (long), `minPrice` (number), `maxPrice` (number)

2) **GET** `/api/v1/dishes/{id}` — *Chi tiết món ăn*  
- 404 nếu không tồn tại hoặc đã bị soft-delete.

3) **POST** `/api/v1/dishes` — *Tạo món*  
Body:
```json
{
  "name": "Bo bit tet sot tieu xanh",
  "description": "Bo My nhap khau...",
  "imageUrl": "http://example.com/images/bo-bit-tet.jpg",
  "price": 250000.0,
  "categoryId": 1
}
```
Validation:
- `name` không trống, **> 7 ký tự**
- `price` > 0
- `categoryId` phải tồn tại
- Server tự set `startDate` (now) & `status` (`ON_SALE`)

4) **PUT** `/api/v1/dishes/{id}` — *Cập nhật món*  
- 404 nếu không tồn tại  
- 409 (hoặc 400) nếu trạng thái hiện tại là `DELETED`  
- Cho phép đổi `status` giữa `ON_SALE` và `STOPPED`

5) **DELETE** `/api/v1/dishes/{id}` — *Soft Delete*  
- 204 No Content nếu thành công  
- 404 nếu không tồn tại  
- 409 nếu đã `DELETED`

---

## 6. Ví dụ test nhanh (cURL)

```bash
# Lấy categories
curl -s http://localhost:8080/api/v1/categories | jq

# List mặc định
curl -s http://localhost:8080/api/v1/dishes | jq

# Phân trang + sắp xếp + lọc
curl -sG "http://localhost:8080/api/v1/dishes" \
  --data-urlencode "page=2" \
  --data-urlencode "limit=5" \
  --data-urlencode "sortBy=price" \
  --data-urlencode "sortDir=asc" \
  --data-urlencode "keyword=bo" \
  --data-urlencode "categoryId=1" \
  --data-urlencode "minPrice=50000" \
  --data-urlencode "maxPrice=150000" | jq

# Tạo món
curl -i -X POST "http://localhost:8080/api/v1/dishes" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Bo bit tet sot tieu xanh",
        "description": "Bo My nhap khau...",
        "imageUrl": "http://example.com/images/bo-bit-tet.jpg",
        "price": 250000.0,
        "categoryId": 1
      }'

# Sửa món (thay {id})
curl -i -X PUT "http://localhost:8080/api/v1/dishes/{id}" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Bo bit tet sot tieu den",
        "description": "Bo My nhap khau...",
        "imageUrl": "http://example.com/images/bo-bit-tet-v2.jpg",
        "price": 260000.0,
        "categoryId": 1,
        "status": "STOPPED"
      }'

# Xoá mềm
curl -i -X DELETE "http://localhost:8080/api/v1/dishes/{id}"
```
