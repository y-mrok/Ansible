.. _control-node-ni-ansible-wo-install:

##################################################
コントロールノードに Ansible をインストール
##################################################
Ubuntu Desktop 20.04.2 LTS のコントロールノードに Ansible をインストールします。

.. code-block:: none

   $ sudo apt install -y python3-pip
   $ pip3 install ansible
   $ pip3 show ansible
   $ pip3 show ansible-base
   $ ansible --version

上記のコマンドを実行したログです。

.. literalinclude:: ./log/install.log
   :language: none
   :emphasize-lines: 1, 249, 278, 289

.. literalinclude:: ./log/install2.log
   :language: none
   :emphasize-lines: 1

.. note::

   - Linux ディストリビューションごとや他の OS に Ansible をインストールする方法は次のリンクで確認ください。

      `Installing Ansible <https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html>`_

   - 2021-05-22 時点で :command:`pip3 install ansible` でインストールされるのは ansible-core と ansible の 2 つです。 ansible-core は ansible-base の後継です。

      .. code-block:: none
         :emphasize-lines: 1, 13, 25

         piyo@vmpc:~$ pip3 show ansible-core
         Name: ansible-core
         Version: 2.11.0
         Summary: Radically simple IT automation
         Home-page: https://ansible.com/
         Author: Ansible, Inc.
         Author-email: info@ansible.com
         License: GPLv3+
         Location: /home/piyo/.local/lib/python3.8/site-packages
         Requires: PyYAML, packaging, jinja2, resolvelib, cryptography
         Required-by: ansible
         piyo@vmpc:~$ 
         piyo@vmpc:~$ pip3 show ansible
         Name: ansible
         Version: 4.0.0
         Summary: Radically simple IT automation
         Home-page: https://ansible.com/
         Author: Ansible, Inc.
         Author-email: info@ansible.com
         License: GPLv3+
         Location: /home/piyo/.local/lib/python3.8/site-packages
         Requires: ansible-core
         Required-by: 
         piyo@vmpc:~$ 
         piyo@vmpc:~$ ansible --version
         ansible [core 2.11.0] 
           config file = None
           configured module search path = ['/home/piyo/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
           ansible python module location = /home/piyo/.local/lib/python3.8/site-packages/ansible
           ansible collection location = /home/piyo/.ansible/collections:/usr/share/ansible/collections
           executable location = /home/piyo/.local/bin/ansible
           python version = 3.8.5 (default, Jan 27 2021, 15:41:15) [GCC 9.3.0]
           jinja version = 2.11.3
           libyaml = True
         piyo@vmpc:~$ 