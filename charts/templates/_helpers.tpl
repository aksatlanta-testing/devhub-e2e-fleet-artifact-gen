
{{- define "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.fullname" -}}
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


{{- define "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.labels" -}}
helm.sh/chart: {{ include "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.chart" . }}
{{ include "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo03c6a329-a91b-4c3e-ada7-eeec8cf5c550.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}