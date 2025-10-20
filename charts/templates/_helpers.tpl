
{{- define "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.fullname" -}}
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


{{- define "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.labels" -}}
helm.sh/chart: {{ include "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.chart" . }}
{{ include "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24eab0bb-0440-42d1-bf59-1d9e9d1e1bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}