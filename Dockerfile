FROM lucidfrontier45/python-uwsgi
COPY /requirements /src/requirements
WORKDIR /src/
RUN pip install --no-cache-dir -r /src/requirements/base.txt
COPY . /src/
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["uwsgi", "--http-socket", ":80", "--wsgi-file", "infoapteka/wsgi.py", "--processes", "4"]
