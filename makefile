all: README.txt$

target:  
       README.txt: guessinggame.sh
       echo "#GUESSING GAME#" > README.md
       echo >> README.md
       echo "*Time Stamp at which make was run:*" >> README.md
       date >> README.md
       echo >> README.md
       echo "Lines of code in guessinggame.sh:" >> README.md
       wc -l guessinggame.sh|egrep -o '[0-9]+' >> README.md
clean:
      rm $@
