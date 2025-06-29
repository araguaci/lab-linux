
# Debian Commands

- 1
  - 1.1
  - 1.2
- 用户与组管理
  - `useradd`
  - `usermod`
  - `userdel`
  - `groupadd`
  - `groupmod`
  - `groupdel`
  - `passwd`
  - `adduser/deluser/addgroup/delgroup`

## 用户与组管理

### `useradd`

```bash
$ useradd --help
Usage: useradd [options] LOGIN
       useradd -D
       useradd -D [options]

Options:
      --badname                 do not check for bad names
  -b, --base-dir BASE_DIR       base directory for the home directory of the
                                new account
      --btrfs-subvolume-home    use BTRFS subvolume for home directory
  -c, --comment COMMENT         GECOS field of the new account
  -d, --home-dir HOME_DIR       home directory of the new account
  -D, --defaults                print or change default useradd configuration
  -e, --expiredate EXPIRE_DATE  expiration date of the new account
  -f, --inactive INACTIVE       password inactivity period of the new account
  -F, --add-subids-for-system   add entries to sub[ud]id even when adding a system user
  -g, --gid GROUP               name or ID of the primary group of the new
                                account
  -G, --groups GROUPS           list of supplementary groups of the new
                                account
  -h, --help                    display this help message and exit
  -k, --skel SKEL_DIR           use this alternative skeleton directory
  -K, --key KEY=VALUE           override /etc/login.defs defaults
  -l, --no-log-init             do not add the user to the lastlog and
                                faillog databases
  -m, --create-home             create the user's home directory
  -M, --no-create-home          do not create the user's home directory
  -N, --no-user-group           do not create a group with the same name as
                                the user
  -o, --non-unique              allow to create users with duplicate
                                (non-unique) UID
  -p, --password PASSWORD       encrypted password of the new account
  -r, --system                  create a system account
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -s, --shell SHELL             login shell of the new account
  -u, --uid UID                 user ID of the new account
  -U, --user-group              create a group with the same name as the user
  -Z, --selinux-user SEUSER     use a specific SEUSER for the SELinux user mapping
```

### `usermod`

```bash
$ usermod --help
Usage: usermod [options] LOGIN

Options:
  -a, --append                  append the user to the supplemental GROUPS
                                mentioned by the -G option without removing
                                the user from other groups
  -b, --badname                 allow bad names
  -c, --comment COMMENT         new value of the GECOS field
  -d, --home HOME_DIR           new home directory for the user account
  -e, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
  -f, --inactive INACTIVE       set password inactive after expiration
                                to INACTIVE
  -g, --gid GROUP               force use GROUP as new primary group
  -G, --groups GROUPS           new list of supplementary GROUPS
  -h, --help                    display this help message and exit
  -l, --login NEW_LOGIN         new value of the login name
  -L, --lock                    lock the user account
  -m, --move-home               move contents of the home directory to the
                                new location (use only with -d)
  -o, --non-unique              allow using duplicate (non-unique) UID
  -p, --password PASSWORD       use encrypted password for the new password
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -r, --remove                  remove the user from only the supplemental GROUPS
                                mentioned by the -G option without removing
                                the user from other groups
  -R, --root CHROOT_DIR         directory to chroot into
  -s, --shell SHELL             new login shell for the user account
  -u, --uid UID                 new UID for the user account
  -U, --unlock                  unlock the user account
  -v, --add-subuids FIRST-LAST  add range of subordinate uids
  -V, --del-subuids FIRST-LAST  remove range of subordinate uids
  -w, --add-subgids FIRST-LAST  add range of subordinate gids
  -W, --del-subgids FIRST-LAST  remove range of subordinate gids
  -Z, --selinux-user SEUSER     new SELinux user mapping for the user account
```

### `userdel`

```bash
$ userdel --help
Usage: userdel [options] LOGIN

Options:
  -f, --force                   force some actions that would fail otherwise
                                e.g. removal of user still logged in
                                or files, even if not owned by the user
  -h, --help                    display this help message and exit
  -r, --remove                  remove home directory and mail spool
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -Z, --selinux-user            remove any SELinux user mapping for the user
```

### `groupadd`

```bash
$ groupadd --help
Usage: groupadd [options] GROUP

Options:
  -f, --force                   exit successfully if the group already exists,
                                and cancel -g if the GID is already used
  -g, --gid GID                 use GID for the new group
  -h, --help                    display this help message and exit
  -K, --key KEY=VALUE           override /etc/login.defs defaults
  -o, --non-unique              allow to create groups with duplicate
                                (non-unique) GID
  -p, --password PASSWORD       use this encrypted password for the new group
  -r, --system                  create a system account
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DI        directory prefix
  -U, --users USERS             list of user members of this group
```

### `groupmod`

```bash
$ groupmod --help
Usage: groupmod [options] GROUP

Options:
  -a, --append                  append the users mentioned by -U option to the group
                                without removing existing user members
  -g, --gid GID                 change the group ID to GID
  -h, --help                    display this help message and exit
  -n, --new-name NEW_GROUP      change the name to NEW_GROUP
  -o, --non-unique              allow to use a duplicate (non-unique) GID
  -p, --password PASSWORD       change the password to this (encrypted)
                                PASSWORD
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -U, --users USERS             list of user members of this group
```

### `groupdel`

```bash
groupdel --help
Usage: groupdel [options] GROUP

Options:
  -h, --help                    display this help message and exit
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -f, --force                   delete group even if it is the primary group of a user
```

### `passwd`

```bash
$ passwd --help
Usage: passwd [options] [LOGIN]

Options:
  -a, --all                     report password status on all accounts
  -d, --delete                  delete the password for the named account
  -e, --expire                  force expire the password for the named account
  -h, --help                    display this help message and exit
  -k, --keep-tokens             change password only if expired
  -i, --inactive INACTIVE       set password inactive after expiration
                                to INACTIVE
  -l, --lock                    lock the password of the named account
  -n, --mindays MIN_DAYS        set minimum number of days before password
                                change to MIN_DAYS
  -q, --quiet                   quiet mode
  -r, --repository REPOSITORY   change password in REPOSITORY repository
  -R, --root CHROOT_DIR         directory to chroot into
  -S, --status                  report password status on the named account
  -u, --unlock                  unlock the password of the named account
  -w, --warndays WARN_DAYS      set expiration warning days to WARN_DAYS
  -x, --maxdays MAX_DAYS        set maximum number of days before password
                                change to MAX_DAYS
```

### `adduser`

```bash
$ adduser --help
adduser [--uid id] [--firstuid id] [--lastuid id]
        [--gid id] [--firstgid id] [--lastgid id] [--ingroup group]
        [--add-extra-groups] [--shell shell]
        [--comment comment] [--home dir] [--no-create-home]
        [--allow-all-names] [--allow-bad-names]
        [--disabled-password] [--disabled-login]
        [--conf file] [--quiet] [--verbose] [--debug]
        user
    Add a normal user

adduser --system
        [--uid id] [--group] [--ingroup group] [--gid id]
        [--shell shell] [--comment comment] [--home dir] [--no-create-home]
        [--conf file] [--quiet] [--verbose] [--debug]
        user
   Add a system user

adduser --group
        [--gid ID] [--firstgid id] [--lastgid id]
        [--conf file] [--quiet] [--verbose] [--debug]
        group
addgroup
        [--gid ID] [--firstgid id] [--lastgid id]
        [--conf file] [--quiet] [--verbose] [--debug]
        group
   Add a user group

addgroup --system
        [--gid id]
        [--conf file] [--quiet] [--verbose] [--debug]
        group
   Add a system group

adduser USER GROUP
   Add an existing user to an existing group
```

### `deluser`

```bash
$ deluser --help
deluser [--system] [--remove-home] [--remove-all-files] [--backup]
        [--backup-to dir] [--backup-suffix str] [--conf file]
        [--quiet] [--verbose] [--debug] user

  remove a normal user from the system

deluser --group [--system] [--only-if-empty] [--conf file] [--quiet]
        [--verbose] [--debug] group
delgroup [--system] [--only-if-empty] [--conf file] [--quiet]
         [--verbose] [--debug] group
  remove a group from the system

deluser [--conf file] [--quiet] [--verbose] [--debug] user group
  remove the user from a group
```

### `addgroup`

```bash
$ addgroup --help
adduser [--uid id] [--firstuid id] [--lastuid id]
        [--gid id] [--firstgid id] [--lastgid id] [--ingroup group]
        [--add-extra-groups] [--shell shell]
        [--comment comment] [--home dir] [--no-create-home]
        [--allow-all-names] [--allow-bad-names]
        [--disabled-password] [--disabled-login]
        [--conf file] [--quiet] [--verbose] [--debug]
        user
    Add a normal user

adduser --system
        [--uid id] [--group] [--ingroup group] [--gid id]
        [--shell shell] [--comment comment] [--home dir] [--no-create-home]
        [--conf file] [--quiet] [--verbose] [--debug]
        user
   Add a system user

adduser --group
        [--gid ID] [--firstgid id] [--lastgid id]
        [--conf file] [--quiet] [--verbose] [--debug]
        group
addgroup
        [--gid ID] [--firstgid id] [--lastgid id]
        [--conf file] [--quiet] [--verbose] [--debug]
        group
   Add a user group

addgroup --system
        [--gid id]
        [--conf file] [--quiet] [--verbose] [--debug]
        group
   Add a system group

adduser USER GROUP
   Add an existing user to an existing group
```

### `delgroup`

```bash
deluser [--system] [--remove-home] [--remove-all-files] [--backup]
        [--backup-to dir] [--backup-suffix str] [--conf file]
        [--quiet] [--verbose] [--debug] user

  remove a normal user from the system

deluser --group [--system] [--only-if-empty] [--conf file] [--quiet]
        [--verbose] [--debug] group
delgroup [--system] [--only-if-empty] [--conf file] [--quiet]
         [--verbose] [--debug] group
  remove a group from the system

deluser [--conf file] [--quiet] [--verbose] [--debug] user group
  remove the user from a group
```