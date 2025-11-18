
{{- define "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.fullname" -}}
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


{{- define "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.labels" -}}
helm.sh/chart: {{ include "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.chart" . }}
{{ include "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo20d3694e-af9e-4529-af15-79d1dc4acfde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}