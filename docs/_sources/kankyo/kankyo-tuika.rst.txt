.. _kankyo-tuika:

##################################################
管理対象ノードを追加
##################################################
ディストリビューションごとに管理対象ノードを 3 台作成する Vagrantfile とインベントファイルです。

.. _kankyo-tuika-vagrant:

**************************************************
Vagrant
**************************************************

.. _kankyo-tuika-vagrant-node:

管理対象ノードの一覧
==================================================
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
   * - 4
     - CentOS 7
     - beryllium
     - 192.168.23.14
   * - 5
     - CentOS 7
     - boron
     - 192.168.23.15
   * - 6
     - CentOS 7
     - carbon
     - 192.168.23.16
   * - 7
     - Ubuntu 20.04 LTS
     - nitrogen
     - 192.168.23.17
   * - 8
     - Ubuntu 20.04 LTS
     - oxygen
     - 192.168.23.18
   * - 9
     - Ubuntu 20.04 LTS
     - fluorine
     - 192.168.23.19
   * - 10
     - Ubuntu 18.04 LTS
     - neon
     - 192.168.23.20
   * - 11
     - Ubuntu 18.04 LTS
     - sodium
     - 192.168.23.21
   * - 12
     - Ubuntu 18.04 LTS
     - magnesium
     - 192.168.23.22
   * - 13
     - Debian 10
     - aluminum
     - 192.168.23.23
   * - 14
     - Debian 10
     - silicon
     - 192.168.23.24
   * - 15
     - Debian 10
     - phosphorus
     - 192.168.23.25
   * - 16
     - Debian 9
     - sulfur
     - 192.168.23.26
   * - 17
     - Debian 9
     - chlorine
     - 192.168.23.27
   * - 18
     - Debian 9
     - argon
     - 192.168.23.28
   * - 19
     - AlmaLinux 8
     - nickel
     - 192.168.23.38
   * - 20
     - AlmaLinux 8
     - copper
     - 192.168.23.37
   * - 21
     - AlmaLinux 8
     - zinc
     - 192.168.23.36
   * - 22
     - OracleLinux 8
     - gallium
     - 192.168.23.42
   * - 23
     - OracleLinux 8
     - germanium
     - 192.168.23.43
   * - 24
     - OracleLinux 8
     - arsenic
     - 192.168.23.44
   * - 25
     - OracleLinux 7
     - selenium
     - 192.168.23.45
   * - 26
     - OracleLinux 7
     - vabromine
     - 192.168.23.46
   * - 27
     - OracleLinux 7
     - krypton
     - 192.168.23.47
   * - 28
     - openSUSE Leap 15
     - potassium
     - 192.168.23.29
   * - 29
     - openSUSE Leap 15
     - calcium
     - 192.168.23.30
   * - 30
     - openSUSE Leap 15
     - scandium
     - 192.168.23.31
   * - 31
     - Fedora 33
     - titanium
     - 192.168.23.32
   * - 32
     - Fedora 33
     - vanadium
     - 192.168.23.33
   * - 33
     - Fedora 33
     - chromium
     - 192.168.23.34
   * - 34
     - FreeBSD 12
     - manganese
     - 192.168.23.35
   * - 35
     - FreeBSD 12
     - rubidium
     - 192.168.23.48
   * - 36
     - FreeBSD 12
     - strontium
     - 192.168.23.49
   * - 37
     - FreeBSD 11
     - yttrium
     - 192.168.23.50
   * - 38
     - FreeBSD 11
     - zirconium
     - 192.168.23.51
   * - 39
     - FreeBSD 11
     - niobium
     - 192.168.23.52
   * - 40
     - Arch Linux
     - molybdenum
     - 192.168.23.53
   * - 41
     - Arch Linux
     - technetium
     - 192.168.23.54
   * - 42
     - Arch Linux
     - ruthenium
     - 192.168.23.55

.. _kankyo-tuika-vagrant-vagrantfile:

Vagrantfile
==================================================
.. note::

   Vagrantfile を作成するにあたり、下記サイトを参考にしました。ありがとうございました。

   - `Vagrant Cloud <https://app.vagrantup.com/boxes/search>`_
   - `Oracle Linux Vagrant Boxes <https://yum.oracle.com/boxes/>`_

.. literalinclude:: ./vagrant/Vagrantfile2
   :language: none

.. _kankyo-tuika-play:

**************************************************
プレイ
**************************************************

.. _kankyo-tuika-inventory:

インベントリファイル
==================================================
.. literalinclude:: ./yaml/hosts2.yml
   :language: yaml

.. _kankyo-tuika-playbookfile:

プレイブックファイル
==================================================
「 :ref:`kankyo-setuzoku` 」のプレイを FreeBSD 対応に変更しました。

.. literalinclude:: ./yaml/node2.yml
   :language: yaml

.. _kankyo-tuika-sudo:

sudo 用ファイル : sudo.txt
==================================================
.. code-block:: none

   ansible-user ALL=(ALL:ALL) NOPASSWD: ALL

.. _kankyo-tuika-log:

実行ログ
==================================================
.. literalinclude:: ./log/kankyo-tuika-log.log
   :language: none
