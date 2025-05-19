
{{- define "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.fullname" -}}
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


{{- define "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.labels" -}}
helm.sh/chart: {{ include "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.chart" . }}
{{ include "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1e3f6f20-debc-4e3f-b29a-01e9466db7db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}