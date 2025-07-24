
{{- define "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.labels" -}}
helm.sh/chart: {{ include "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.chart" . }}
{{ include "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1880daeb-e901-4f52-8b0a-c30bd46d7309.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}