
{{- define "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.fullname" -}}
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


{{- define "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.labels" -}}
helm.sh/chart: {{ include "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.chart" . }}
{{ include "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda1ad478-8b95-4f14-941c-b550a69c531b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}