Ansible Role: Prezto
####################

Setup prezto zsh framework.

- `zsh documentation <http://www.zsh.org/>`_
- `prezto <https://github.com/sorin-ionescu/prezto>`_  `(Screenshots) <http://mikebuss.com/2014/04/07/customizing-prezto/>`_

Requirements
============

Requires git 2.0.0+ and ZSH 5.0.0+.

- RedHat family
- Debian family

Dependencies
============

- Role `ansible-zsh <https://github.com/loliee/ansible-zsh>`_

Role Variables
==============

`prezto_users_config`
--------------------

Unset by default, dictionary should defined like this:

.. code:: yaml

      prezto_users_config:
        [username]:
          [option]: [value]

**Options**

+------------------+-----------+--------------------------------------------------+
| parameter        | type      | Comments                                         |
+==================+===========+==================================================+
| prezto_zpreztorc | text      | Lines to append to ~/.zpreztorc opts, modules... |
+------------------+-----------+--------------------------------------------------+

`defaults`
----------

Check **defaults/main.yml**

+------------------+-----------+--------------------------------------------------+
| parameter        | type      | Comments                                         |
+==================+===========+==================================================+
| prezto_source    | string    | Should not be modified, source prezto            |
+------------------+-----------+--------------------------------------------------+
| prezto_repo_url  | string    | Defaults http://github.com/loliee/prezto.git     |
+------------------+-----------+--------------------------------------------------+


Example Playbook
================

The following playbook will install prezto for root user.

.. code::

    # ./tests/main.yml

    - hosts: localhost
      remote_user: root
      vars:
        prezto_users_config:
          root:
            file_zpreztorc: |
              # Set up prezto
              zstyle ':prezto:*:*' color 'yes'
              zstyle ':prezto:load' pmodule \
                'environment' \
                'terminal' \
                'editor' \
                'history' \
                'directory' \
                'spectrum' \
                'utility' \
                'completion' \
                'prompt'\

              zstyle ':prezto:module:prompt' theme 'mlpure'


Run test, make sure ansible-zsh and ansible-prezto are in your role path.

.. code:: bash

  sudo ansible-playbook -i ./tests/inventory ./tests/main.yml --connection=local
