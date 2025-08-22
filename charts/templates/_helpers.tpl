
{{- define "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.fullname" -}}
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


{{- define "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.labels" -}}
helm.sh/chart: {{ include "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.chart" . }}
{{ include "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd00ede1-d507-48aa-ad2c-b78848fbe5bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}