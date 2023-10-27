# 使用一个基础镜像
FROM alpine

RUN apk add parallel aria2

# 将 entrypoint.sh 脚本复制到容器中
COPY test.sh /download/test.sh
COPY links.txt /download/links.txt


# 使脚本可执行
RUN chmod +x /download/test.sh

# 设置该脚本作为入口点
# ENTRYPOINT ["/download/entrypoint.sh"]
# 设置该脚本作为入口点，并使容器保持运行状态
# ENTRYPOINT ["/download/entrypoint.sh", "&&", "tail", "-f", "/dev/null"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD [ "sh", "/download/test.sh"]
