#!/bin/bash
start_time=$(date +%s)

for j in {2023..2024}; do
    # 设置年份条件
    if [ $j -eq 2024 ]; then
        max_month=10  # 2024年只处理到10月
    else
        max_month=12
    fi

    # 月份循环
    for k in $(seq 1 $max_month); do
        month=$(printf "%02d" "$k")

        # 计算当月实际天数
        last_day=$(date -d "$j-$month-01 +1 month -1 day" +%d)
        last_day=${last_day#0}  # 去除前导零,但这里last_day如果是08,09会出现错误，因为bash默认是八进制，但没有月份是小于十天的，因此不影响

        # 兼容macOS系统（需要使用gdate）
        # last_day=$(gdate -d "$j-$month-01 +1 month -1 day" +%d)

        # 日期循环
        for i in $(seq 1 $last_day); do
            date=$(printf "%02d" "$i")
            # 执行模型命令（完整路径示例）
            ai-models --assets "Fengwu_EC/" \
                    --input cds \
                    --date "${j}${month}${date}" \
                    --time 1800 \
                    fengwuv2 \
                    --lead-time 360 \
                    --path "/mnt/ssd1/account702893/DecisionGroup/pingce2/fengwu/result_cn/D${j}/${j}${month}${date}/18/${j}${month}${date}_18_output_cn.grib"
        done
    done
done

end_time=$(date +%s)
total_time=$((end_time - start_time))
echo "总推理时间：$total_time 秒"
