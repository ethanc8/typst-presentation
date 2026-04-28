default: export execute
    
export:
    typst eval --input callisto-export=true --in presentation.typ \
      'query(<notebook>).first().value' > export.ipynb

execute:
    jupyter-nbconvert --to notebook --execute --inplace export.ipynb

watch:
    watchexec -w . -f '**/*.typ' just export execute
