#!/bin/bash

# 定义起始日期和结束日期
start_date="2023-01-01"
end_date="2023-12-31"

# 使用 date 命令生成从起始日期到结束日期的每一天
current_date="$start_date"

while [ "$current_date" != "$end_date" ]; do
  # 格式化日期为 YYYYMMDD
  formatted_date=$(date -d "$current_date" +%Y%m%d)

  # 创建主文件夹
  mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/00"
  mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/06"
  mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/12"
  mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/18"

  # 输出创建的文件夹名称
  echo "Created $formatted_date/00 and $formatted_date/06 and $formatted_date/12 and $formatted_date/18"

  # 移动到下一天
  current_date=$(date -I -d "$current_date + 1 day")
done

# 创建最后一天的文件夹
formatted_date=$(date -d "$end_date" +%Y%m%d)
mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/00"
mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/06"
mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/12"
mkdir -p "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D2023/$formatted_date/18"

echo "Created $formatted_date/00 and $formatted_date/06 and $formatted_date/12 and $formatted_date/18"
