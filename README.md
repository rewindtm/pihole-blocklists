# Pi-hole Blocklists

Liste hosts unificate e deduplicate, generate a partire dalle sorgenti elencate in [`adlists.txt`](adlists.txt) (generali, pubblicità, tracking/telemetria, malware/phishing, altri).

## File

- [`merged-hosts.txt`](merged-hosts.txt) — lista principale (formato `0.0.0.0 dominio`), **1.778.510 domini unici**, esclude le fonti per contenuti adulti.
- [`adult-hosts-part-01.txt`](adult-hosts-part-01.txt) e [`adult-hosts-part-02.txt`](adult-hosts-part-02.txt) — lista per il blocco contenuti per adulti (Prigent-Adult + pi_blocklist_porn_top1m), **4.596.350 domini unici** in totale, divisa in due parti perché il file intero (161 MB) superava il limite di 100 MB per file di GitHub. Usale solo se vuoi anche questo blocco.
- [`adlists.txt`](adlists.txt) — elenco delle sorgenti originali usate per generare i file unificati.

## Utilizzo

1. Scarica i file che ti interessano (link "Raw" su GitHub), ad esempio:
   ```bash
   curl -L -O https://raw.githubusercontent.com/rewindtm/pihole-blocklists/master/merged-hosts.txt
   # opzionale, solo se vuoi anche il blocco adult:
   curl -L -O https://raw.githubusercontent.com/rewindtm/pihole-blocklists/master/adult-hosts-part-01.txt
   curl -L -O https://raw.githubusercontent.com/rewindtm/pihole-blocklists/master/adult-hosts-part-02.txt
   cat adult-hosts-part-01.txt adult-hosts-part-02.txt > adult-hosts.txt
   ```
2. Su Pi-hole puoi importarli come liste locali (es. servendoli da un web server locale e aggiungendoli come Adlist custom in **Group Management > Adlists**), oppure usarli come file hosts di sistema.
3. Vai su **Tools > Update Gravity** per applicare.

## Rigenerare i file

Le liste sorgente vengono scaricate, i domini estratti (sia da hosts-file che da liste "plain domain") con `extract.awk`, separati in principale/adult in base alla fonte, uniti con `sort -u`.
