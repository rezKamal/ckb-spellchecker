CORPUS=../ling073-ckb-corpus/ckb.wikipedia.2021-02-23.txt
MORPH=../ckb.automorf.bin
RLX=../ckb.rlx.bin # you might need to remove ".bin"
TOKENS=`cat ${CORPUS} | lt-proc ${MORPH} | sed 's/$\W*\^/$\n^/g' | wc -l`
ANALYSES=`cat ${CORPUS} | lt-proc ${MORPH} | sed 's/$\W*\^/$\n^/g' | cut -f2- -d'/' | sed 's/\//\n/g' | wc -l`
DISAMB=`cat ${CORPUS} | lt-proc ${MORPH} | cg-proc ${RLX} | sed 's/$\W*\^/$\n^/g' | cut -f2- -d'/' | sed 's/\//\n/g' | wc -l`
AMBIGPRE=`calc $ANALYSES/$TOKENS`
AMBIGPOST=`calc $DISAMB/$TOKENS`
echo "Ambiguity before disambiguation: ${AMBIGPRE}"
echo "Ambiguity after disambiguation: ${AMBIGPOST}"
