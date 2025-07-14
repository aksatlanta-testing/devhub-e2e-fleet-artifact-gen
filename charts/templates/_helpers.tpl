
{{- define "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.fullname" -}}
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


{{- define "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.labels" -}}
helm.sh/chart: {{ include "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.chart" . }}
{{ include "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob98e8094-1439-4741-b0f3-34f7c7e22a7c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}