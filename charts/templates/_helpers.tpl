
{{- define "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.fullname" -}}
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


{{- define "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.labels" -}}
helm.sh/chart: {{ include "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.chart" . }}
{{ include "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe2ba4ba-7b4d-4616-bb6d-06d4f7222e9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}