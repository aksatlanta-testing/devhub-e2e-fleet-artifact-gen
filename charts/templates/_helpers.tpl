
{{- define "go-echobd528447-a426-450b-9119-1ec939c8b30a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd528447-a426-450b-9119-1ec939c8b30a.fullname" -}}
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


{{- define "go-echobd528447-a426-450b-9119-1ec939c8b30a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd528447-a426-450b-9119-1ec939c8b30a.labels" -}}
helm.sh/chart: {{ include "go-echobd528447-a426-450b-9119-1ec939c8b30a.chart" . }}
{{ include "go-echobd528447-a426-450b-9119-1ec939c8b30a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd528447-a426-450b-9119-1ec939c8b30a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd528447-a426-450b-9119-1ec939c8b30a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}