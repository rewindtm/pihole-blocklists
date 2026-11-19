# Pi-hole Blocklists

Liste hosts unificate e deduplicate, generate a partire dalle sorgenti elencate in [`adlists.txt`](adlists.txt) (generali, pubblicità, tracking/telemetria, malware/phishing, altri).

## File

- [`merged-hosts.txt.gz`](merged-hosts.txt.gz) — lista principale (formato `0.0.0.0 dominio`), **1.778.510 domini unici**, esclude le fonti per contenuti adulti.
- [`adult-hosts.txt.gz`](adult-hosts.txt.gz) — lista separata solo per il blocco contenuti per adulti (Prigent-Adult + pi_blocklist_porn_top1m), **4.596.350 domini unici**. Da usare solo se vuoi anche questo blocco, aggiungendola come lista extra.
- [`adlists.txt`](adlists.txt) — elenco delle sorgenti originali usate per generare i file unificati.

## Utilizzo

1. Scarica e decomprimi il/i file che ti interessano:
   ```bash
   curl -L -o merged-hosts.txt.gz https://raw.githubusercontent.com/rewindtm/pihole-blocklists/master/merged-hosts.txt.gz
   gunzip merged-hosts.txt.gz
   # opzionale, solo se vuoi anche il blocco adult:
   curl -L -o adult-hosts.txt.gz https://raw.githubusercontent.com/rewindtm/pihole-blocklists/master/adult-hosts.txt.gz
   gunzip adult-hosts.txt.gz
   ```
2. Su Pi-hole puoi importarli come liste locali (es. servendoli da un web server locale e aggiungendoli come Adlist custom in **Group Management > Adlists**), oppure usarli come file hosts di sistema.
3. Vai su **Tools > Update Gravity** per applicare.

## Rigenerare i file

Le liste sorgente vengono scaricate, i domini estratti (sia da hosts-file che da liste "plain domain") con `extract.awk`, separati in principale/adult in base alla fonte, uniti con `sort -u` e compressi con `gzip -9`.
