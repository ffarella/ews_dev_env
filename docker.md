
Virtual machine setup
==========

- Set the following rules on `Network` > `Adapter slot="0" ...` > `NAT`
    ```
    <Forwarding name="webapp1" proto="1" hostip="192.168.1.88" hostport="5000" guestport="5000"/>
    <Forwarding name="jupyter" proto="1" hostip="192.168.1.88" hostport="8888" guestport="8888"/>
    <Forwarding name="postgresql" proto="0" hostip="192.168.1.88" hostport="5432" guestport="5432"/>
    <Forwarding name="webapp2" proto="1" hostip="192.168.1.88" hostport="5001" guestport="5001"/>
    <Forwarding name="webapp3" proto="1" hostip="192.168.1.88" hostport="5002" guestport="5002"/>
    ```

- Set the following rules on `SharedFolders`
    ```
    <SharedFolder name="/ews_drives/f" hostPath="F:\" writable="true" autoMount="true"/>
    <SharedFolder name="/ews_drives/p" hostPath="P:\" writable="true" autoMount="true"/>
    <SharedFolder name="/ews_drives/s" hostPath="S:\" writable="true" autoMount="true"/>
    <SharedFolder name="/ews_drives/t" hostPath="T:\" writable="true" autoMount="true"/>
    ```

cs = tvtk.ConeSource()
cs.resolution = 36
m = tvtk.PolyDataMapper()
configure_input(m, cs.output)
a = tvtk.Actor()
a.mapper = m
p = a.property
p.representation = 'w'