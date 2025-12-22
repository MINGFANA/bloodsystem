### 1. 环境准备
确保你的本地环境已安装：
*   JDK 17
*   MySQL 8.0+
*   Maven 3.6+

### 2. 数据库配置
1.  在 MySQL 中创建一个名为 `blood_db` 的数据库：
    ```sql
    CREATE DATABASE blood_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
    ```
2.  (可选) 运行项目根目录下的 `blood_db.sql` 初始化表结构（或者让 Spring Boot 自动生成）。

### 3. 修改配置
打开 `src/main/resources/application.properties`，修改你的数据库账号密码：

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/blood_db?useSSL=false&...
spring.datasource.username=root
spring.datasource.password=你的数据库密码
```

### 4. 启动项目
在项目根目录下运行：

```bash
mvn clean spring-boot:run
```

或者打包运行：

```bash
mvn clean package
java -jar target/bloodsystem-0.0.1-SNAPSHOT.jar
```

### 5. 访问系统
*   浏览器打开：`http://localhost:8080`
*   **默认管理员账号**：`admin`
*   **默认密码**：`123456`

---

## 使用指南

### 1. 批量导入数据
1.  进入 **“导入”** 页面。
2.  打开你的 Excel 表格，复制包含表头的多行数据。
    *   *Excel 格式要求*：列顺序需大致为 `姓名 | ID | HPA-1 | ... | HPA-21 | HLA-A1 | HLA-A2 | HLA-B1 | HLA-B2`。
3.  将内容粘贴到网页文本框中，点击 **“确认导入”**。

### 2. 配型查询
1.  进入 **“配型查询”** 页面。
2.  输入患者的 **血型**。
3.  (可选) 输入 **排除抗体 (DSA)**：例如输入 `A*02`，系统将排除所有 HLA-A 位点包含 02 组的供者。
4.  输入患者的 **HPA / HLA 基因型**。
5.  点击 **“立即配型”**，系统将根据评分高低列出所有供者。
    *   **绿色**：高度匹配
    *   **蓝色**：部分匹配/相容
    *   **红色**：禁忌/有抗体冲突 
---
