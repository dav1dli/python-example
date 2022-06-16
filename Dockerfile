FROM registry.access.redhat.com/ubi9/python-39:1-52
USER default
ENV PATH="$HOME/bin:$PATH"
WORKDIR $HOME
COPY --chown=default:root requirements.txt $HOME
COPY --chown=default:root app.py $HOME
RUN pip3 install -r requirements.txt
EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
