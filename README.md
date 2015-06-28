# Ansible Role: Prezto

[![Build Status](https://travis-ci.org/loliee/ansible-prezto.svg?branch=master)](https://travis-ci.org/loliee/ansible-prezto)

Setup prezto zsh framework.

- [zsh documentation](http://www.zsh.org/)
- [prezto](https://github.com/sorin-ionescu/prezto>) [Screenshots](http://mikebuss.com/2014/04/07/customizing-prezto/)

## Requirements

Requires git 2.0.0+ and ZSH 5.0.0+.

- RedHat family
- Debian family
- Darwin (OSX).

## Dependencies

- Role [ansible-zsh](https://github.com/loliee/ansible-zsh)

## Role Variables

### `__users__`

Unset by default, dictionary should defined like this:

```yaml

__users__:
  [username]:
    [option]: [value]
```

**Options**

| Option                   | Type     | Comments                                                    |
|--------------------------|----------|-------------------------------------------------------------|
| prezto_editor            | string   | `vi` or `emacs`. default value is `vi`.                     |
| prezto_install           | boolean  | `Yes` or `No`, default value is `No`.                       |
| prezto_zpreztorc_content | text     | Lines to append to `~/.zpreztorc opts`, modules...          |

### Defaults

Check [defaults/main.yml](defaults/main.yml) for default values.

| Variable                         | Type     | Comments                                            |
|----------------------------------|----------|-----------------------------------------------------|
| prezto_repo_url                  | string   | Prezto git repository url.                          |
| prezto_source                    | string   | How to source prezto in `.zshrc`.                   |
| prezto_zpreztorc_default_content | text     | Default lines to append to `~/.zpreztorc opts`, modules..., if `prezto_zpreztorc_content` no set. |

## Example Playbook

The following playbook will install prezto for root user.

``` yaml
# ./tests/playbooks/main.yml

- hosts: localhost
  remote_user: root
  vars:
    __users__:
      root:
        prezto_install: Yes
```

Run test, make sure ansible-zsh and ansible-prezto are in your role path.

## Run Tests

Require [serverspec](http://serverspec.org/), check [.travis.yml](.travis.yml) for details.

## Licence

MIT © [Maxime Loliée](https://github.com/loliee/)
