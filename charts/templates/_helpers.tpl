
{{- define "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.fullname" -}}
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


{{- define "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.labels" -}}
helm.sh/chart: {{ include "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.chart" . }}
{{ include "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee3e65b3-85b2-49c3-8c1c-f0051411984a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}