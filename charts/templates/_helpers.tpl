
{{- define "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.fullname" -}}
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


{{- define "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.labels" -}}
helm.sh/chart: {{ include "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.chart" . }}
{{ include "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1500e20-acdc-40a0-a7e8-65d9da433255.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}