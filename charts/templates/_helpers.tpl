
{{- define "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.fullname" -}}
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


{{- define "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.labels" -}}
helm.sh/chart: {{ include "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.chart" . }}
{{ include "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob856b645-dc5c-44b1-951b-b6eb6c11ce20.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}