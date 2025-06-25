
{{- define "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.fullname" -}}
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


{{- define "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.labels" -}}
helm.sh/chart: {{ include "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.chart" . }}
{{ include "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo529c20c1-afe2-49a5-96fd-1178989dd474.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}