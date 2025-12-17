
{{- define "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.fullname" -}}
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


{{- define "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.labels" -}}
helm.sh/chart: {{ include "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.chart" . }}
{{ include "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0b0784e-c143-454f-835f-3f874b90eaaf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}