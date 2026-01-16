
{{- define "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.fullname" -}}
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


{{- define "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.labels" -}}
helm.sh/chart: {{ include "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.chart" . }}
{{ include "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5c82cef-e498-4656-86fb-423d0c433efb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}