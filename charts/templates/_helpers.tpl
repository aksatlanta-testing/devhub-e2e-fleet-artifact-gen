
{{- define "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.fullname" -}}
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


{{- define "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.labels" -}}
helm.sh/chart: {{ include "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.chart" . }}
{{ include "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea56cc58-9a44-4fc2-9874-5e358dbb9509.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}