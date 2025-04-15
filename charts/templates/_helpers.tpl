
{{- define "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.fullname" -}}
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


{{- define "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.labels" -}}
helm.sh/chart: {{ include "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.chart" . }}
{{ include "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob2010164-fd20-44c4-ac2c-23b624fe8bbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}