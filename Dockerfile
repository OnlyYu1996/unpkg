FROM harbor.yn.bjgykj.cn/base_image/node:16.19.0-alpine
# 🔴 pnpm 安装
RUN corepack enable
# 🔴 创建 unpkg 目录
WORKDIR /unpkg
# 🔴 拷贝源代码
COPY package /unpkg
# 🔴 安装依赖
RUN pnpm i -P
# 🔴 设置环境变量
ENV NODE_ENV=production \
NPM_REGISTRY_URL=https://registry.npmjs.org \
ORIGIN=http://webhub.bjgykj.cn/registry/

EXPOSE 8080

CMD [ "pnpm","start" ]
