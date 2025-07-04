
{{- define "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.fullname" -}}
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


{{- define "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.labels" -}}
helm.sh/chart: {{ include "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.chart" . }}
{{ include "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae8a8059-3167-4d7b-b7a5-56dfe784e344.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}