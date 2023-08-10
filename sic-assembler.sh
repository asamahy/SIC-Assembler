#!/bin/zsh

InFile=$1
LOCCTR=0
OPCODE='0'
LABEL=''
OPERAND=0
declare -a SYMTAB=()
declare -a LOCTAB=()
declare -a arr=()

# check if the file exists
if [[ ! -f "${InFile}" ]]; then
    echo "Usage: sic-assembler.sh <input file>"
    exit 1
fi
# # replace tabs with dashes using sed
    sed 's/^\t/-\t/' $InFile > /tmp/in.txt

#read the file line by line
while read line; do

    LABEL=$(echo "${line}" | awk -F'\t' '{print $1}')
    OPCODE=$(echo "${line}" | awk -F'\t' '{print $2}')
    OPERAND=$(echo "${line}" | awk -F'\t' '{print $3}')

    case $OPCODE in
        START)
            LOCCTR=$(echo ${line} | awk '{print $3}')
           if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
           fi
           
            ;;
        LDX)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
              
            ;;
        RSUB)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
              fi
              
            ;;
        LDA)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
              
            ;;
        STA)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
              
            ;;
        STCH)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        STX)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        ADD)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
              
            ;;
        SUB)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        MUL)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        DIV)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        COMP)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        J)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        TIX)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
              
            ;;
        TD)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        RD)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        WD)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        STL)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        STSW)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        RESW)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                OPERAND=$((3*$OPERAND))
                OPERAND=$(printf '%x' "$OPERAND")
                LOCCTR=$((LOCCTR+$OPERAND))
              else
                LOCCTR=$((LOCCTR+3*"${OPERAND}"))
              fi
              
            ;;
        RESB)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        BYTE)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        WORD)
            if [[ -n "${LABEL}" ]]; then
                SYMTAB+=("$LABEL")
                LOCTAB+=("$LOCCTR")
                LOCCTR=$((LOCCTR+3))
              else
                LOCCTR=$((LOCCTR+3))
              fi
            ;;
        END)
            ;;
        # *)
        #     LOCCTR=$((LOCCTR+3))
        #     ;;
    esac

done < "/tmp/in.txt"

echo -e "Symbol Table \t Location"  > symtab.txt
echo -e "------------ \t --------"  >> symtab.txt

# set -x
for ((i=1; i<=${#SYMTAB[@]}; i++)); do
    arr+=("${SYMTAB[i]} \t\t ${LOCTAB[i]}")
done

for item in ${arr[@]}; do
if [[ "${item}" != "-"* ]]; then
    echo "${item}"
fi
done >> symtab.txt