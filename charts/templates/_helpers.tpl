
{{- define "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.fullname" -}}
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


{{- define "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.labels" -}}
helm.sh/chart: {{ include "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.chart" . }}
{{ include "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5694dbc1-c30d-4eed-b84a-88005725fafd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}