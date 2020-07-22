# base_flutter_template

A new Flutter template project.

## 项目结构

<pre>
android                           // android
build                             // 编译后的文件
ios                               // ios
lib
  |-- common                      // 公共配置
  |-- components                  // 公共组件目录 
  |-- models                      // 公共 model 数据
    |-- global_model.dart         // 公共 model 文件 可以多个
  |-- pages                       // 页面容器组件
    |-- home                      // 业务组件文件夹
      |-- home_api.dart           // 业务接口请求 api
      |-- home_model.dart         // 业务数据 model
      |-- home_view_model.dart    // 业务数据处理 viewModel
      |-- home_view.dart          // 业务页面 引入 viewModel
      |-- home.dart               // 业务页面
  |-- provider                    // 全局 provider viewModel
  |-- routes                      // 路由
  |-- services                    // 公共接口请求 api
  |-- tabs                        // 全局 tabs
  |-- utils                       // 工具
    |-- request.dart              // 请求工具类
    |-- tools.dart                // 常用工具类
  |-- main                        // 主入口
.gitignore
pubspec.yaml                      // 包
README.md  
</pre>