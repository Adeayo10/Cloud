# Assignment

## Instruction
Your login name: altschool i.e., home directory /home/altschool. The home directory contains the following sub-directories: code, tests, personal, misc Unless otherwise specified, you are running commands from the home directory.

create user: <i>sudo useradd -m -s /usr/bin/bash Altschool</i><br>
Give it a password: <i>sudo passwd Altschool</i><br>

<mark>Optional (you can choose to add to sudoers at this point): </marrk><i>sudo usermod -aG sudo Altschool</i>

now we can switch into our User which is Altschool: <i>sudo su - Altschool</i><br>

Create the subdirectories: <i>mkdir /home/Altschool/code /home/Altschool/tests /home/Altschool/personal /home/Altschool/misc</i><br>

## Questions
1. Change directory to the tests directory using absolute pathname
### Answer
<i>cd /home/Altschool/tests</i><br>

## Questions
2. Change directory to the test directory using relative pathname
### Answer
<i>cd ../tests</i><br>

## Questions
3. Use echo command to create a file named fileA with text content ‘Hello A’ in the misc directory
### Answer
<i>echo 'Hello A' > /home/Altschool/misc/fileA</i><br>

## Questions
4. Create an empty file named fileB in the misc directory. Populate the file with a dummy content afterwards
### Answer
<i>touch /home/Altschool/misc/fileB</i><br>
<i>echo 'Dummy Content' > /home/Altschool/misc/fileB</i><br>

## Questions
5. Copy contents of fileA into fileC
### Answer
<i>cp /home/Altschool/misc/fileA /home/Altschool/misc/fileC</i><br>

## Questions
6. Move contents of fileB into fileD
### Answer
<i>mv /home/Altschool/misc/fileB  /home/Altschool/misc/fileD</i><br>

## Questions
7. Create a tar archive called misc.tar for the contents of misc directory
### Answer
<i>tar -cvf /home/Altschool/misc/misc.tar /home/Altschool/misc</i><br>

## Questions
8. Compress the tar archive to create a misc.tar.gz file
### Answer
<i>gzip /home/Altschool/misc/misc.tar</i><br>

## Questions
9. Create a user and force the user to change his/her password upon login
### Answer
<i>sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1) Altschool2</i><br>

## Questions
10. Lock a users password
### Answer
<i>sudo passwd -l Altschool2</i><br>

## Questions
11. Create a user with no login shell
### Answer
<i>sudo useradd -m -s /usr/sbin/nologin Altschool3</i><br>

## Questions
12. Disable password based authentication for ssh
### Answer
<i>sudo nano /etc/ssh/sshd_config</i><br>
Change the line <i>PasswordAuthentication yes</i> to <i>PasswordAuthentication no</i><br>


## Questions
13. Disable root login for ssh
### Answer
<i>sudo nano /etc/ssh/sshd_config</i><br>
Change the line <i>PermitRootLogin yes</i> to <i>PermitRootLogin no</i><br>