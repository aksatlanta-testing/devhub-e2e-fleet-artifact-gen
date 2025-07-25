
{{- define "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.fullname" -}}
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


{{- define "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.labels" -}}
helm.sh/chart: {{ include "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.chart" . }}
{{ include "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffdb3699-545d-4a9f-acfa-b9e27707ca7a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}