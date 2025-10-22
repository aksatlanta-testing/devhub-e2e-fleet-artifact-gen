
{{- define "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.fullname" -}}
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


{{- define "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.labels" -}}
helm.sh/chart: {{ include "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.chart" . }}
{{ include "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5f12c5f-9219-43a6-a928-0f71597b07c0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}