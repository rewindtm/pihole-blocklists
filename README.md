# Pi-hole Blocklists

Un unico file hosts che unisce i domini di tutte le liste elencate in [`adlists.txt`](adlists.txt) (generali, pubblicità, tracking/telemetria, malware/phishing, altri), deduplicati.

## File

- [`merged-hosts.txt.gz`](merged-hosts.txt.gz) — file hosts unico e compresso (formato `0.0.0.0 dominio`), **~6,35 milioni di domini unici**, ~204 MB decompresso / ~31 MB compresso. La dimensione è dovuta soprattutto alla lista Prigent-Adult (~4,6 milioni di voci).
- [`adlists.txt`](adlists.txt) — elenco delle sorgenti originali usate per generare il file unificato.

## Utilizzo

1. Scarica e decomprimi il file:
   ```bash
   curl -L -o merged-hosts.txt.gz https://raw.githubusercontent.com/rewindtm/pihole-blocklists/master/merged-hosts.txt.gz
   gunzip merged-hosts.txt.gz
   ```
2. Su Pi-hole puoi importarlo come lista locale (es. copiandolo in `/etc/pihole/local.list` o aggiungendolo come file custom in **Group Management > Adlists** servendolo da un web server locale), oppure usarlo come file hosts di sistema.
3. Vai su **Tools > Update Gravity** per applicare.

> Nota: data la dimensione (milioni di voci), valuta se escludere la lista adult/porn se non necessaria, per ridurre drasticamente il peso del file e il tempo di elaborazione di Gravity.

## Rigenerare il file

Le liste sorgente vengono scaricate, i domini estratti (sia da hosts-file che da liste "plain domain") e uniti con `sort -u`, poi compressi con `gzip -9`.
