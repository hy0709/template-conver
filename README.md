##### rancher2.3 Oge 自定义应用商店

```
charts/rdp/<app version>/
  │─app-readme.md            # 应用的简短描述
  │─Chart.yaml               # 应用版本图标名称以及地址
  │─questions.yml            # 自定义配置值
  │─README.md                # 应用说明
  │─values.yaml              # 默认配置值
  │─templates/               # 应用模板
     │─ deployment.yaml      # 应用部署文件，从values.yaml及questions.yml 中获取相对应的值
     │─ service.yaml         # 应用服务信息
```
