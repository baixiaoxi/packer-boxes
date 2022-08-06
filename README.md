* 创建最新的ubuntu对应的vagrant box
* 结合了以下项目
 > [bento ubuntu](https://github.com/chef/bento)
 > [ubuntu 2004](https://github.com/geerlingguy/packer-boxes)
 > [autoinstall config](https://ubuntu.com/server/docs/install/autoinstall-reference)
 > [unattended installation](https://www.packer.io/guides/automatic-operating-system-installs/preseed_ubuntu)
 
* 使用packer构建virtualbox对应的box, 对应的资料应该找packer而不是vagrant
 > packer build -only=virtualbox-iso ubuntu-22.04-amd64.json
* 过程中需要从raw.githubusercontent.com下载vagrant的公钥, 需要翻墙, 可采用一下方式:
 > 方式1, 修改hosts。echo "185.199.109.133 raw.githubusercontent.com" >> /etc/hosts;
 > 方式2, ~/.bash_profile里设置代理
* 内存和磁盘太小, cpu算力不够, 会导致box制作时间过长。建议调高一点, 方便快速测试
* 下载roles到本地, 若是等packer的ansible-local去下载, 可能会因为超时等问题导致下载失败
 > ansible-galaxy install -r ./shared/requirements.yml --roles-path ./roles
* 查看配置情况
 > packer inspect ubuntu-22.04-amd64.json
* 检查配置是否正确
 > packer validate ubuntu-22.04-amd64.json