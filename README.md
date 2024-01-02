## Usage

Follow these steps to set up and run the project locally on Eclipse IDE:

### Prerequisites
1. Install [Eclipse IDE for Enterprise Java and Web Developers](https://www.eclipse.org/downloads/packages/release/2022-03/r/eclipse-ide-enterprise-java-and-web-developers).

2. Install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/). Ensure that you have a local MySQL server running.

3. Download the [MySQL Connector/J JDBC driver](https://dev.mysql.com/downloads/connector/j/). Manually configure the database connection and create tables.
    - Open `src/main/java/com/Db/DBConnect.java`.
    - In the `getConnection` method, update the URL, username, and password to match your MySQL configuration:
        ```java
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/<database_name>", "<username>", "<password>");
        ```
        Replace `<database_name>`, `<username>`, and `<password>` with your actual MySQL database name, username, and password.
    - Execute the SQL queries provided in `src/main/webapp/fordev/SQL_QUERIES.txt` to create the database and tables.
    - Add the MySQL Connector/J JAR file to your project's build path.

4. Download [Apache Tomcat](http://tomcat.apache.org/) to run your web application.

### Setup
1. Clone the repository:
    ```bash
    git clone [repository_url]
    ```

2. Open Eclipse IDE and import the project:
    - Navigate to `File -> Import -> General -> Existing Projects into Workspace`.
    - Select the root directory of the cloned project and click `Finish`.

3. Configure MySQL Connection:
    - Open `src/main/resources/application.properties`.
    - Update the `spring.datasource.url`, `spring.datasource.username`, and `spring.datasource.password` properties to match your MySQL configuration.

4. Run the Application:
    - Right-click on the project (`DrPharma`) in Eclipse.
    - Choose `Run As -> Run on Server`.
    - Select your Tomcat server and click `Finish`.

5. Access the Application:
    - Open a web browser and navigate to [http://localhost:8080/DrPharma](http://localhost:8080/DrPharma).

6. Explore the Features:
    - Log in with existing credentials or sign up.
    - Test video conferencing, medicine ordering, and appointment booking functionalities.

### Notes
- Make sure your MySQL server is running before starting the application.
- Adjust configurations in `application.properties` as needed.
- If you encounter any issues, refer to the project documentation or contact the project maintainer.

Happy coding!
