.. _kankyo-managed:

##################################################
管理対象ノードを作成
##################################################
Vagrant を使用して管理対象ノードを作成します。

.. _kankyo-managed-node:

**************************************************
作成する管理対象ノード
**************************************************
.. list-table::
   :header-rows: 1
   :widths: 1, 15, 15, 15

   * - #
     - distribution
     - hostname
     - IP address

   * - 1
     - CentOS 8
     - hydrogen
     - 192.168.23.11
   * - 2
     - CentOS 8
     - helium
     - 192.168.23.12
   * - 3
     - CentOS 8
     - lithium
     - 192.168.23.13

.. _kankyo-managed-packages:

**************************************************
使用パッケージ
**************************************************
今回使用したパッケージです。インストール手順の説明は省略します。

- `vagrant_2.2.16_x86_64.msi <https://www.vagrantup.com/downloads>`_

.. _kankyo-managed-vm:

**************************************************
管理対象ノード用仮想マシンの仕様
**************************************************
管理対象ノード用仮想マシンの共通仕様です。NIC #2 を使用してコントロールノードと通信します。

- CPU x 1
- Memory(MB) : 4096
- NIC #1 : NAT
- NIC #2 : Internal network (intnet)

管理対象ノード用 OS は `Vagrant Cloud <https://app.vagrantup.com/boxes/search>`_ から入手します。

.. _kankyo-managed-vagrant:

**************************************************
Vagrant
**************************************************

.. _kankyo-managed-vagrant-naiyo:

Vagrantfile
==================================================
.. literalinclude:: ./vagrant/Vagrantfile
   :language: none

.. _kankyo-managed-vagrant-command:

コマンド
==================================================
.. code-block:: none

   vagrant up

.. _kankyo-managed-vagrant-log:

実行ログ
==================================================
.. literalinclude:: ./log/kankyo-managed-vagrant.log
   :language: none
   :emphasize-lines: 1
